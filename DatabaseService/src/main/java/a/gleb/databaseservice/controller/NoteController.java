package a.gleb.databaseservice.controller;

import a.gleb.databaseservice.dao.dto.NoteDto;
import a.gleb.databaseservice.service.NoteService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("note-controller")
@Tag(name = "CRUD for note")
@Controller
@AllArgsConstructor
@RequestMapping("/api")
public class NoteController {

    private final NoteService noteService;
    private static final String NOTE_CONTROLLER = "Note controller";
    private static final String STATUS_OK = "OK";
    private static final String SERVER_ERROR = "INTERNAL_SERVER_ERROR";
    private static final String UNAUTHORIZED = "UNAUTHORIZED";

    @Operation(
            summary = "Create new note",
            tags = {NOTE_CONTROLLER}
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = STATUS_OK,
                        content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "400", description = UNAUTHORIZED,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "500", description = SERVER_ERROR,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
            }
    )
    @PostMapping("/note")
    @ResponseBody
    public ResponseEntity<NoteDto> createNewNote(@RequestBody NoteDto note){
        return new ResponseEntity<>(noteService.saveNote(note), HttpStatus.OK);
    }

    @Operation(
            summary = "Select note by id",
            tags = {NOTE_CONTROLLER}
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = STATUS_OK,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "400", description = UNAUTHORIZED,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "500", description = SERVER_ERROR,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
            }
    )
    @GetMapping("/note/{id}")
    @ResponseBody
    public ResponseEntity<NoteDto> getNote(@PathVariable ("id") String noteId){
        return new ResponseEntity<>(noteService.findNoteById(noteId), HttpStatus.OK);
    }

    @Operation(
            summary = "Get all notes",
            tags = {NOTE_CONTROLLER}
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = STATUS_OK,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "400", description = UNAUTHORIZED,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "500", description = SERVER_ERROR,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
            }
    )
    @GetMapping("/note")
    @ResponseBody
    public ResponseEntity<List<NoteDto>> getAllNotes(){
        return new ResponseEntity<>(noteService.findAllNotes(), HttpStatus.OK);
    }

    @Operation(
            summary = "Edit note",
            tags = {NOTE_CONTROLLER}
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = STATUS_OK,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "400", description = UNAUTHORIZED,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "500", description = SERVER_ERROR,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
            }
    )
    @PutMapping("/note")
    @ResponseBody
    public ResponseEntity<NoteDto> editNote(@RequestBody NoteDto noteDto){
        return new ResponseEntity<>(noteService.editNote(noteDto), HttpStatus.OK);
    }

    @Operation(
            summary = "Delete note by id",
            tags = {NOTE_CONTROLLER}
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = STATUS_OK,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "400", description = UNAUTHORIZED,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
                    @ApiResponse(responseCode = "500", description = SERVER_ERROR,
                            content = @Content(mediaType = MediaType.APPLICATION_JSON_VALUE)),
            }
    )
    @DeleteMapping("/note/{id}")
    @ResponseBody
    public ResponseEntity<List<NoteDto>> deleteById(@PathVariable ("id") String noteId){
        noteService.deleteNote(noteId);
        return new ResponseEntity<>(noteService.findAllNotes(), HttpStatus.OK);
    }

}
