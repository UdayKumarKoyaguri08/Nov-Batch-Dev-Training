public class UpdateContactDiscription {
    
    public void UpdateContactDiscriptions()
    {
        List<Account> oAccount= [SELECT Id,Name,Description FROM Account];
        for(Account acc:oAccount)
        {
            List<Contact> oContact=[SELECT Id,AccountId,Title From Contact];
            For(Contact con:oContact)
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