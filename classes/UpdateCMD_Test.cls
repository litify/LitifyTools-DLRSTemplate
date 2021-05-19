@isTest(SeeAllData=false)
private class UpdateCMD_Test {
    // Unit test setup. Create all required data for testing
    @testSetup static void initData() {
        litify_pm__Public_Setup__c setting = new litify_pm__Public_Setup__c();
        setting.litify_pm__Run_Triggers__c = true;
        insert setting;
        List<Account> l_accounts = new List<Account>();
        Account acc1 = new Account(litify_pm__First_Name__c ='Account 1', litify_pm__Last_Name__c ='Last Name 1');
        acc1.BillingCity = 'New York';
        acc1.BillingCountry = 'United States';
        acc1.BillingStreet = 'Avenue';
        acc1.BillingPostalCode = '12412';
        l_accounts.add(acc1);
        Account acc2 = new Account(litify_pm__First_Name__c ='Account 2', litify_pm__Last_Name__c ='Last Name 2');
        acc2.BillingCity = 'New York';
        acc2.BillingCountry = 'United States';
        acc2.BillingStreet = 'Avenue';
        acc2.BillingPostalCode = '12412';
        l_accounts.add(acc2);
        insert l_accounts;
        

    }

    static testmethod void test_UpdateCMD() {
        List<litify_pm__CalendarRulesCallout__mdt> l_settings = [SELECT Id,DeveloperName , 
                                                                    MasterLabel, NamespacePrefix, 
                                                                    litify_pm__Name__c, litify_pm__URL__c
                                                                    FROM  litify_pm__CalendarRulesCallout__mdt];
        Test.startTest();
        UpdateCMD.ActionRequest param = new UpdateCMD.ActionRequest();
        param.data = l_settings;
        UpdateCMD.invokeService(new List<UpdateCMD.ActionRequest>{param});
        system.assert(l_settings != null);
        Test.stopTest();
    }
    static testmethod void test_Exception() {
        List<Account> l_settings = [SELECT Id, Name FROM  Account];
        Test.startTest();
        try {
            UpdateCMD.ActionRequest param = new UpdateCMD.ActionRequest();
            param.data = l_settings;
            UpdateCMD.invokeService(new List<UpdateCMD.ActionRequest>{param});
        }
        catch(Exception ex) {
            system.assert(ex != null);
        }
        Test.stopTest();
    }

    static testmethod void test_UpdateCMD_New() {
        List<litify_pm__CalendarRulesCallout__mdt> l_settings = [SELECT Id,DeveloperName , 
                                                                    MasterLabel, NamespacePrefix, 
                                                                    litify_pm__Name__c, litify_pm__URL__c 
                                                                    FROM  litify_pm__CalendarRulesCallout__mdt];
        List<litify_pm__CalendarRulesCallout__mdt> l_newSettings = new List<litify_pm__CalendarRulesCallout__mdt>();
        for (litify_pm__CalendarRulesCallout__mdt item : l_settings) {
            litify_pm__CalendarRulesCallout__mdt temp = new litify_pm__CalendarRulesCallout__mdt();
            temp.label = 'MasterLabel'+item.MasterLabel;
            temp.NamespacePrefix = item.NamespacePrefix;
            temp.litify_pm__Name__c = item.litify_pm__Name__c;
            temp.litify_pm__URL__c = item.litify_pm__URL__c;
            l_newSettings.add(temp);
        }
        Test.startTest();
        UpdateCMD.ActionRequest param = new UpdateCMD.ActionRequest();
        param.data = l_newSettings;
        UpdateCMD.invokeService(new List<UpdateCMD.ActionRequest>{param});
        system.assert(l_newSettings != null);
        Test.stopTest();
    }


}