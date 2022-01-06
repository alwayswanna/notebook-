package a.gleb.databaseservice.configuration;

import a.gleb.databaseservice.configuration.properties.ApplicationConfigurationProperties;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationPropertiesScan(basePackageClasses = ApplicationConfigurationProperties.class)
public class ApplicationConfig { }
