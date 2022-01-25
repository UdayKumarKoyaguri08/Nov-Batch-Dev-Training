public class newUserPermissionSetProfile 
{
   @future
   public static void PermissionSetProfile (Set<Id> userIds) 
   {
      system.debug('Inside future');
       PermissionSet permissionset=[Select Id,Name From PermissionSet Where Name='Marketing_User_Permissions'];
       List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
       for (User u : [Select Id, Name FROM User Where Id IN : userIds])
       {
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = permissionset.Id; 
            psa.AssigneeId = u.Id;
            permissionSetList.add(psa);
       }
       insert permissionSetList;
    }
}
