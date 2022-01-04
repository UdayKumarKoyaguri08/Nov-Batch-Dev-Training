public class UpdateContactDiscription implements Database.Batchable<sObject> {
   
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        
        String query = 'SELECT Account.Id,Account.Name, Account.Description,Title,Description FROM Contact WHERE Account.Name!=null';
        return Database.getQueryLocator(query);
        
    }
    public void execute(Database.BatchableContext bc, List<Contact> contacts)
    {
        List<Account> oAccount=[SELECT Id,Name,Description FROM Account];
        for(Account acc:oAccount)
        {
		    if (contacts != null)        
            {
              for(Contact con : contacts)
              {
                 if(acc.Id==con.AccountId)
                 {
                    if(con.Title == null || acc.Description == null){
                        con.Title = ' ';
                        acc.Description = ' ';
                    }
                    con.Description =con.Title+' '+'of'+' '+acc.Name +' : '+acc.Description;
                    update con;
                 }
              }
            }
        }
    }
    public void finish(Database.BatchableContext bc)
    {
		
    }

}
