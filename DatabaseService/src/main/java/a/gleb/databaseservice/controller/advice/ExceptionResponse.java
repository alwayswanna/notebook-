package a.gleb.databaseservice.controller.advice;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.ZonedDateTime;

@Data
@AllArgsConstructor
public class ExceptionResponse {

    private String message;
    private ZonedDateTime timeStamp;
}
