/**
 * @description Scheduler class to run the exchange rate update on a schedule
 * Students will implement the execute method to update rates
 */
global class ExchangeRateScheduler implements Schedulable {
    
    /**
     * @description Executes the scheduled job to update exchange rates
     * @param context The SchedulableContext
     */
    global void execute(SchedulableContext context) {
        // TODO: Implement the method to update exchange rates
        // 1. Call ExchangeRateService.updateExchangeRates()
        // 2. Add error handling
        // 3. Consider adding logging if available
    }
    
    /**
     * @description Schedules the job to run daily
     * @return String The ID of the scheduled job
     */
    public static String scheduleDaily() {
        // TODO: Implement the method to schedule the job daily
        // 1. Create a CRON expression for a daily schedule (e.g., midnight)
        // 2. Create an instance of the scheduler
        // 3. Schedule the job using System.schedule
        // 4. Return the job ID
        
        return null; // Replace with actual implementation
    }
}