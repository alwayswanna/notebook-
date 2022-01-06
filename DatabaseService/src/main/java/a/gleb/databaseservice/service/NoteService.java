package a.gleb.databaseservice.service;

import a.gleb.databaseservice.dao.Note;
import a.gleb.databaseservice.dao.dto.NoteDto;
import a.gleb.databaseservice.dao.exception.NoSuchNoteException;
import a.gleb.databaseservice.repository.NoteRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public record NoteService(NoteRepository noteRepository) {

    public NoteDto saveNote(NoteDto note) {
        var result = noteRepository.save(Note.fromNoteDto(note));
        return NoteDto.fromNote(result);
    }

    public void deleteNote(final String noteId) {
        try {
            noteRepository.deleteById(noteId);
        } catch (Exception e) {
            throw new NoSuchNoteException("There are no such note for delete with [id]:" + noteId);
        }
    }

    public NoteDto findNoteById(final String noteId) {
        var result = noteRepository.findById(noteId);
        return result.map(NoteDto::fromNote).orElseThrow(
                () -> new NoSuchNoteException("There are no such note with [id]:" + noteId)
        );
    }

    public NoteDto editNote(final NoteDto note) {
        var beforeEditNote = findNoteById(note.getId());
        beforeEditNote.setTitle(note.getTitle());
        beforeEditNote.setDescription(note.getDescription());
        beforeEditNote.setPayload(note.getPayload());
        return saveNote(beforeEditNote);
    }

    public List<NoteDto> findAllNotes() {
        return noteRepository.findAll().stream()
                .map(NoteDto::fromNote)
                .collect(Collectors.toList());
    }
}
