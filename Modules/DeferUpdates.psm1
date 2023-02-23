function Defer-Updates ($days) {
    Import-Module PSWindowsUpdate
    Set-WUSettings -DeferUpgrade:$true -DeferUpgradeTime:$days
}
