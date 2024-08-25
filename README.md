# E-Shop

## configuration

```
~~~ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.24.0, on Ubuntu 20.04.3 LTS (fossa-kingdra-adl
    X127) 5.13.0-1022-oem, locale en_US.UTF-8)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Android Studio (version 2023.3)
[✓] Android Studio (version 2024.1)
[✓] IntelliJ IDEA Ultimate Edition (version 2024.2)
[✓] VS Code (version 1.92.2)
[✓] Connected device (3 available)
[✓] Network resources

• No issues found!
```
then 
```
flutter pub get 
flutter run
```
## Clean Architecture 

The figure bellow represents the variation applied in this project:

<img width="1064" alt="arch_2" src="https://github.com/user-attachments/assets/8f890a6a-1bd5-4b8f-b01a-5381147937ac">

In this case, we're only using three layers: Presentation, Domain and Data.

### The presentation layer (UI)

This is the layer where the Flutter framework resides. Here, you'll find classes that are part of the framework, such as Widgets, BuildContexts, and libraries that consume the framework, including state management libraries.

Typically, the classes in this layer are responsible for:

- Managing the application's state.
- Handling UI aspects of an app, such as managing page navigation, displaying data, implementing internationalization, and ensuring proper UI updates.

### The domain layer

This layer represents the core domain of the problem we are addressing, encompassing the business rules. Hence, it should be an independent Dart module without dependencies on external layers. It includes:

- Plain entity classes (like Character entity)
- Use-case classes that encapsulate the specific business logic for a given use case (like GetAllCharacters, SignInUser, and others...)
- Abstractions for data access, normally repository or services interfaces

A use-case has no knowledge of the data source, whether it comes from a memory cache, local storage, or the internet. All these implementation details have been abstracted out through the use of Repository Interfaces. From the use-case's perspective, all that matters is that it receives the required data.

### The data layer

This layer serves as a boundary between our application and the external world. Its primary responsibility is to load data from external sources, such as the internet or databases, and convert it to a format that aligns with our Domain expectations. It plays a vital role in supplying data to the use cases and performs the following tasks:

- Data retrieval: It makes network and/or database calls, retrieving data from the appropriate data sources.
- Repository implementations: It includes the implementations of the repositories defined in the domain layer, providing concrete functionality for accessing and manipulating data.
- Data coordination: It coordinates the flow of data between multiple sources. For example, it can fetch data from the network, store it locally, and then return it to the use case.
- Data (de)serialization: It handles the conversion of data to and from JSON format, transforming it into Data Transfer Objects (DTOs) for standardized representation.
- Caching management: It can incorporate caching mechanisms, optimizing performance by storing frequently accessed data for quicker retrieval.
