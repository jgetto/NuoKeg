nuodbmgr --broker localhost --user domain --password bird --command "start process sm host localhost database nuokeg-dev archive /tmp/nuokeg-dev initialize yes waitForRunning true"
nuodbmgr --broker localhost --user domain --password bird --command "start process te host localhost database nuokeg-dev options '--dba-user dba --dba-password dba' waitForRunning true"

nuodbmgr --broker localhost --user domain --password bird --command "show domain summary"