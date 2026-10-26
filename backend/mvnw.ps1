param([Parameter(ValueFromRemainingArguments = $true)][string[]]$MavenArguments)

$version = '3.9.9'
$base = Join-Path $PSScriptRoot '.mvn'
$archive = Join-Path $PSScriptRoot '.mvn\apache-maven.zip'
$mavenHome = Join-Path $base "apache-maven-$version"

if (-not (Test-Path (Join-Path $mavenHome 'bin\mvn.cmd'))) {
    New-Item -ItemType Directory -Force -Path (Split-Path $archive) | Out-Null
    Invoke-WebRequest "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/$version/apache-maven-$version-bin.zip" -OutFile $archive
    Expand-Archive -Path $archive -DestinationPath (Split-Path $base) -Force
    Remove-Item -LiteralPath $archive -Force
}

& (Join-Path $mavenHome 'bin\mvn.cmd') @MavenArguments
exit $LASTEXITCODE
