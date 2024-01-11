package cu.edu.cujae.medicina.core.dto;

import org.springframework.lang.NonNull;

public abstract class DBobject {
    @NonNull
    private Long id;

    public DBobject() {
    }

    public DBobject(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
