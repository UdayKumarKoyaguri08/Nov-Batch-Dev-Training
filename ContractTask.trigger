trigger ContractTask on Contract (after insert,after update) {
    List<Task> task=new List<Task>();
         for(Contract con:Trigger.New)
             {
               if(con.Remind_me__c==true)
                {
                       Task tsk=new Task();
                       tsk.Subject='Reminder to close new contract in 10 days !!!';
                       tsk.Status= 'Not started';
                       tsk.Priority= 'high';
                       tsk.OwnerId=con.OwnerId;
                       tsk.ActivityDate=System.today()+10;
                       task.add(tsk);
                }
            }
          if(task.size()>0)
          {
         insert task;
          }

}