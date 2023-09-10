package com.example.datetimechecker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.time.LocalDateTime;
@SpringBootApplication
public class DatetimeCheckerApplication {

	public static void main(String[] args) {
		SpringApplication.run(DatetimeCheckerApplication.class, args);
		checkDateTime();
	}
    public static void checkDateTime() {
        long endTimeMillis = System.currentTimeMillis() + 60000; // 1 minute from now

        while (System.currentTimeMillis() < endTimeMillis) {
            LocalDateTime currentDateTime = LocalDateTime.now();
            System.out.println("Current date and time: " + currentDateTime);

            try {
                Thread.sleep(1000); // Sleep for 1 second
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
