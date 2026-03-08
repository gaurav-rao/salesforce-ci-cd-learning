/**
 * CommissionCalculatorTest - Unit tests for CommissionCalculator
 */
@isTest
public class CommissionCalculatorTest {
    
    /**
     * Test: Calculate commission correctly for positive amounts
     */
    @isTest
    static void testCalculateCommissionPositive() {
        // Arrange
        Decimal amount = 100000;
        Decimal rate = 10;
        Decimal expectedCommission = 10000;
        
        // Act
        Decimal actualCommission = CommissionCalculator.calculateCommission(amount, rate);
        
        // Assert
        System.assertEquals(expectedCommission, actualCommission);
    }
    
    /**
     * Test: Calculate commission with decimal rates
     */
    @isTest
    static void testCalculateCommissionDecimal() {
        // Arrange
        Decimal amount = 50000;
        Decimal rate = 2.5;
        Decimal expectedCommission = 1250;
        
        // Act
        Decimal actualCommission = CommissionCalculator.calculateCommission(amount, rate);
        
        // Assert
        System.assertEquals(expectedCommission, actualCommission);
    }
    
    /**
     * Test: Handle null values
     */
    @isTest
    static void testCalculateCommissionNullValues() {
        // Act & Assert
        Decimal result = CommissionCalculator.calculateCommission(null, null);
        System.assertEquals(0, result);
    }
    
    /**
     * Test: Reject negative amounts
     */
    @isTest
    static void testCalculateCommissionNegativeAmount() {
        try {
            CommissionCalculator.calculateCommission(-100, 10);
            System.assert(false, 'Should have thrown exception');
        } catch (IllegalArgumentException e) {
            System.assert(true);
        }
    }
    
    /**
     * Test: Get commission tier for low amount
     */
    @isTest
    static void testGetCommissionTierLow() {
        String tier = CommissionCalculator.getCommissionTier(30000);
        System.assertEquals('Low', tier);
    }
    
    /**
     * Test: Get commission tier for medium amount
     */
    @isTest
    static void testGetCommissionTierMedium() {
        String tier = CommissionCalculator.getCommissionTier(100000);
        System.assertEquals('Medium', tier);
    }
    
    /**
     * Test: Get commission tier for high amount
     */
    @isTest
    static void testGetCommissionTierHigh() {
        String tier = CommissionCalculator.getCommissionTier(500000);
        System.assertEquals('High', tier);
    }
}