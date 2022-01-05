public class newUserPermissionSetProfile {
    
    @future
    public static void PermissionSetProfile(Set<Id> User)
    {
        List<PermissionSetAssignment> oPSA=[SELECT Id, AssigneeId, PermissionSetId FROM PermissionSetAssignment];
        List<PermissionSet> oPermissionSet=[SELECT Id, Name, ProfileId FROM PermissionSet Where Name='Marketing_User_Permissions'];
        List<User> oUser=[SELECT Id,ProfileId FROM User];
        for(User u :oUser)
        {
          for(PermissionSet per:oPermissionSet)
          {
            List<Profile> oProfile = [SELECT Id, Name FROM Profile where Name='Custom: Marketing Profile'];
            for(Profile pro :oProfile)
            {
                if(per.Name == 'Marketing_User_Permissions'&& pro.Name == 'Custom: Marketing Profile')
                {
                    
                    PermissionSetAssignment p =new PermissionSetAssignment();
                    p.PermissionSetId = per.Id;
                    p.AssigneeId=u.Id;
                    insert p;
                }
            }
           }
        }
    }
}