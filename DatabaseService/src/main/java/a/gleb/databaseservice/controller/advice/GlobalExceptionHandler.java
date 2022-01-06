package a.gleb.databaseservice.controller.advice;

import a.gleb.databaseservice.dao.exception.NoSuchNoteException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.ZonedDateTime;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler
    public ResponseEntity<Object> handleException(NoSuchNoteException exception){
        return new ResponseEntity<>(new ExceptionResponse(exception.getMessage(), ZonedDateTime.now()), HttpStatus.BAD_REQUEST);
    }
}
