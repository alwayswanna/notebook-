package a.gleb.databaseservice.configuration.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("service.setup")
@Data
public class ApplicationConfigurationProperties {

    private String applicationVersion;

}
