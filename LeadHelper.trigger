trigger LeadHelper on Lead (before insert,before update) 
{
   list<Lead> oLead=Trigger.new;
   for(Lead l : oLead)
   {
        if(l.FirstName == null)
        {
           l.FirstName = '';
           l.FirstName = 'Dear' +l.FirstName;
        }
        
   }
}