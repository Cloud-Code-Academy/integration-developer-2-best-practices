/**
 * @description Test class for the ExchangeRateService
 * This will be provided to students to test their implementation
 */
@isTest
private class ExchangeRateServiceTest {
    
    /**
     * @description Sets up test data
     */
    @TestSetup
    static void setupTestData() {
        // Create a custom setting or custom metadata record if needed for configuration
    }
    
    /**
     * @description Tests the getLatestRates method with a successful response
     */
    @isTest
    static void testGetLatestRates_Success() {
        // Set up the mock for a successful response
        Test.setMock(HttpCalloutMock.class, new ExchangeRateMock());
        
        // Call the method to test
        Test.startTest();
        ExchangeRateWrapper wrapper = ExchangeRateService.getLatestRates();
        Test.stopTest();
        
        // Verify the result
        System.assertNotEquals(null, wrapper, 'Wrapper should not be null');
        System.assertEquals('USD', wrapper.base, 'Base currency should be USD');
        System.assertEquals('2023-02-27', wrapper.date, 'Date should match the mock');
        System.assertEquals(9, wrapper.rates.size(), 'Should have 9 rates');
        System.assertEquals(0.9488, wrapper.rates.get('EUR'), 'EUR rate should match');
    }
    
    /**
     * @description Tests the getLatestRates method with an error response
     */
    @isTest
    static void testGetLatestRates_Error() {
        // Set up the mock for an error response
        Test.setMock(HttpCalloutMock.class, new ExchangeRateMock(true));
        
        // Call the method to test and expect an exception
        Test.startTest();
        try {
            ExchangeRateWrapper wrapper = ExchangeRateService.getLatestRates();
            System.assert(false, 'Should have thrown an exception');
        } catch (Exception e) {
            System.assert(e.getMessage().contains('Error'), 'Exception message should mention error');
        }
        Test.stopTest();
    }
    
    /**
     * @description Tests the processRates method
     */
    @isTest
    static void testProcessRates() {
        // Create a wrapper manually
        ExchangeRateWrapper wrapper = new ExchangeRateWrapper();
        wrapper.base = 'USD';
        wrapper.date = '2023-02-27';
        wrapper.timeLastUpdated = 1677456002;
        
        // Add rates
        wrapper.rates = new Map<String, Decimal>{
            'EUR' => 0.9488,
            'GBP' => 0.8393,
            'JPY' => 136.57
        };
        
        // Process the rates
        Test.startTest();
        List<Exchange_Rate__c> rates = ExchangeRateService.processRates(wrapper);
        Test.stopTest();
        
        // Verify the results
        System.assertEquals(3, rates.size(), 'Should have 3 exchange rate records');
        
        // Check that all rates have the correct fields
        for (Exchange_Rate__c rate : rates) {
            System.assertEquals('USD', rate.Base_Currency__c, 'Base currency should be USD');
            System.assertNotEquals(null, rate.Rate__c, 'Rate should not be null');
            System.assertNotEquals(null, rate.Last_Updated__c, 'Last updated should not be null');
        }
        
        // Query to verify that records were inserted
        List<Exchange_Rate__c> insertedRates = [
            SELECT Id, Base_Currency__c, Target_Currency__c, Rate__c
            FROM Exchange_Rate__c
        ];
        System.assertEquals(3, insertedRates.size(), 'Should have 3 records in the database');
    }
    
    /**
     * @description Tests the updateExchangeRates method
     */
    @isTest
    static void testUpdateExchangeRates() {
        // Set up the mock
        Test.setMock(HttpCalloutMock.class, new ExchangeRateMock());
        
        // Call the method to test
        Test.startTest();
        List<Exchange_Rate__c> rates = ExchangeRateService.updateExchangeRates();
        Test.stopTest();
        
        // Verify the results
        System.assertEquals(9, rates.size(), 'Should have 9 exchange rate records');
        
        // Query to verify that records were inserted
        List<Exchange_Rate__c> insertedRates = [
            SELECT Id, Base_Currency__c, Target_Currency__c, Rate__c
            FROM Exchange_Rate__c
        ];
        System.assertEquals(9, insertedRates.size(), 'Should have 9 records in the database');
    }
}