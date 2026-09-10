param(
  [Parameter(Position = 0)]
  [ValidateSet('setup', 'up', 'down')]
  [string]$Action = 'setup'
)

$ErrorActionPreference = 'Stop'
$sutRoot = Join-Path $PSScriptRoot '..\.sut\mattermost-docker'
$composeFiles = @(
  '-f', (Join-Path $sutRoot 'docker-compose.yml'),
  '-f', (Join-Path $sutRoot 'docker-compose.without-nginx.yml')
)

if ($Action -eq 'setup') {
  if (Test-Path (Join-Path $sutRoot '.git')) {
    Write-Host 'O ambiente oficial já está disponível em .sut/mattermost-docker.'
    exit 0
  }

  New-Item -ItemType Directory -Force -Path (Split-Path $sutRoot) | Out-Null
  git clone --depth 1 https://github.com/mattermost/docker.git $sutRoot
  Copy-Item (Join-Path $sutRoot 'env.example') (Join-Path $sutRoot '.env')
  Write-Host 'Ambiente obtido. Revise .sut/mattermost-docker/.env antes de iniciar.'
  exit 0
}

if (-not (Test-Path (Join-Path $sutRoot '.env'))) {
  throw 'Execute npm run sut:setup antes deste comando.'
}

if ($Action -eq 'up') {
  docker compose --env-file (Join-Path $sutRoot '.env') @composeFiles up -d
} else {
  docker compose --env-file (Join-Path $sutRoot '.env') @composeFiles down
}

