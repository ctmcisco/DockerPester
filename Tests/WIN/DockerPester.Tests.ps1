Import-Module Pester
Import-Module "$PSScriptRoot/../../DockerPester/DockerPester.psd1" -Force

Describe "Testing Base Funcionality" {
    $res = Invoke-DockerPester -Image "mcr.microsoft.com/powershell:7.0.0-rc.2-windowsservercore-1809" -InputFolder "$PSScriptRoot/../TestModule/" -PathOnContainer "C:\Temp" -Executor WIN
    it "Result should contain PassThru Object from Pester" {
        $res.TestResult | Should -Not -BeNullOrEmpty
    }
}