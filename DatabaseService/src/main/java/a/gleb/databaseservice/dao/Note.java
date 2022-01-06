package a.gleb.databaseservice.dao;

import a.gleb.databaseservice.dao.dto.NoteDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.ZonedDateTime;

@AllArgsConstructor
@Data
@ToString
@Document(collection = "db_coll")
public class Note {

    @Id
    public String id;

    public String title;

    public String description;

    public String payload;

    public ZonedDateTime time;


    public static Note fromNoteDto(NoteDto noteDto){
        return new Note(
                noteDto.getId(),
                noteDto.getTitle(),
                noteDto.getDescription(),
                noteDto.getPayload(),
                ZonedDateTime.now()
        );
    }
}
