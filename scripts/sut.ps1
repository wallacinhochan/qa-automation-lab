param(
  [Parameter(Position = 0)]
  [ValidateSet('setup', 'up', 'down', 'status')]
  [string]$Action = 'setup'
)

$ErrorActionPreference = 'Stop'
$sutRoot = Join-Path $PSScriptRoot '..\.sut\restful-booker-platform'
$sutRepository = 'https://github.com/mwinteringham/restful-booker-platform.git'
$sutRevision = 'd36bd3f8647a091d406e53bad463c5e3e5d2ece1'
$composeFile = Join-Path $sutRoot 'docker-compose.yml'
$composeOverride = Join-Path $PSScriptRoot '..\docker-compose.sut.override.yml'
$composeArgs = @(
  '--project-name', 'qa-booking-sut',
  '--project-directory', $sutRoot,
  '--file', $composeFile,
  '--file', $composeOverride
)

if ($Action -eq 'setup') {
  if (Test-Path (Join-Path $sutRoot '.git')) {
    $currentRevision = (git -C $sutRoot rev-parse HEAD).Trim()
    if ($LASTEXITCODE -ne 0) {
      throw 'Não foi possível identificar a versão local do SUT.'
    }

    if ($currentRevision -ne $sutRevision) {
      throw "A versão local do SUT difere da versão esperada: $sutRevision."
    }

    Write-Host "O SUT já está disponível na versão $sutRevision."
    exit 0
  }

  New-Item -ItemType Directory -Force -Path $sutRoot | Out-Null
  git -C $sutRoot init
  if ($LASTEXITCODE -ne 0) {
    throw 'Não foi possível inicializar o checkout local do SUT.'
  }

  git -C $sutRoot remote add origin $sutRepository
  git -C $sutRoot fetch --depth 1 origin $sutRevision
  if ($LASTEXITCODE -ne 0) {
    throw 'Não foi possível baixar a versão fixada do SUT.'
  }

  git -C $sutRoot checkout --detach $sutRevision
  if ($LASTEXITCODE -ne 0) {
    throw 'Não foi possível selecionar a versão fixada do SUT.'
  }

  Write-Host "SUT obtido na versão $sutRevision."
  Write-Host 'Inicie o Docker Desktop e execute npm run sut:up.'
  exit 0
}

if (-not (Test-Path $composeFile)) {
  throw 'Execute npm run sut:setup antes deste comando.'
}

if ($Action -eq 'up') {
  Write-Host 'Compilando o SUT sem executar a suíte oficial...'
  $resolvedSutRoot = (Resolve-Path -LiteralPath $sutRoot).Path
  $sourceMount = "type=bind,source=$resolvedSutRoot,target=/workspace"
  docker run --rm `
    --mount $sourceMount `
    --volume qa-booking-maven-cache:/root/.m2 `
    --workdir /workspace `
    maven:3.9-eclipse-temurin-26-alpine `
    mvn --batch-mode clean package '-Dmaven.test.skip=true' `
      --projects auth,booking,room,report,branding,message

  if ($LASTEXITCODE -ne 0) {
    throw 'A compilação do SUT falhou.'
  }

  docker compose @composeArgs up --detach --build
  if ($LASTEXITCODE -ne 0) {
    throw 'Não foi possível iniciar todos os serviços do SUT.'
  }
} elseif ($Action -eq 'down') {
  docker compose @composeArgs down
} else {
  docker compose @composeArgs ps
}
