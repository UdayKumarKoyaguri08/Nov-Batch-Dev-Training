public class CodeChallengeHelperUtil 
{
  public void getAllAccounts()
    {
        List<Account> oAccount = [SELECT Name, Phone FROM Account];
        for(Account acco : oAccount)
        {
            System.debug('Account ::' + acco.Name  +' , '+'Account Phone Number::'+   + acco.Phone);
            
        }
    }
    public void getAllContactCases()
    {
        List<Contact> oContact = [SELECT Account.Name, Account.Rating, Name, Department, Title FROM Contact ORDER BY Name];
        List<Case> oCase = [SELECT CaseNumber, Subject,ContactId FROM Case];
        for(Contact con : oContact)
        {
            
            System.debug('Account.Name ::' + con.Account.Name +','+'Account.Rating ::'+ con.Account.Rating 
                         +','+'Contact Name ::'+ con.Name +','+'Contact Department ::'+ con.Department 
                         +','+'Contact Title ::'+ con.Title);
            
            for(Case cas : oCase)
            {
                 if(con.Id == cas.ContactId) 
                 {
                     
                     System.debug('caseNamber ::' + cas.CaseNumber +','+'Subject ::'+ cas.Subject);
                 }
            }
        }
    }
    public void DMLChallenge()
    {
        Account oAccount = new Account();
        oAccount.Name='HBO'; 
        insert oAccount;
        if(oAccount.Name == 'HBO')
        {
            Opportunity oOpportunity = new Opportunity();
            oOpportunity.Name='Game of Thrones';
            oOpportunity.stageName='Qualification';
            oOpportunity.AccountId=oAccount.Id;
            oOpportunity.CloseDate=system.today();
            insert oOpportunity;
        }
    }
    public void DMLChallenge_V2()
    {
        List<Account> oAccount = [SELECT Name FROM Account];
        for(Account acc : oAccount)
        {
            if(acc.Name == 'HBO')
            {
                acc.Name='HBO Channel'; 
                update oAccount;
            }
        }
    }
}