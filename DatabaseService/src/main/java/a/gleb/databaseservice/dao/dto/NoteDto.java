package a.gleb.databaseservice.dao.dto;

import a.gleb.databaseservice.dao.Note;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Map;

@AllArgsConstructor
@Data
public class NoteDto {

    private String id;
    private String title;
    private String description;
    private String payload;
    private Map<String, String> attributes;

    public static NoteDto fromNote(Note note) {
        return new NoteDto(
                note.getId(),
                note.getTitle(),
                note.getDescription(),
                note.getPayload(),
                Map.of("time", note.getTime().toString())
        );
    }
}
