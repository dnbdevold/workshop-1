#Micronaut: Controllers

Micronaut is the framework we will be using when writing code in this workshop. It’s a Java framework, and has a handy CLI that sets up a gradle project for you through a single command. The git repository you should've already cloned cloned has the project set up already, so there’s no need to download it for this workshop.

The only class currently in the project is `no.dnb.workshop.Application.class`. It is not important to understand how it works, just know that it is what lets Micronaut do what it does. As it stands, this application does nothing. First, try running it by typing `/gradlew run`. The application will successfully run, but you will not be able to interact with it in any meaningful way. To rectify this, we’ll create a “Controller”.

    import io.micronaut.http.MediaType;
    import io.micronaut.http.annotation.Controller;
    import io.micronaut.http.annotation.Get;
    import io.micronaut.http.annotation.Produces;
    
    @Controller("/hello")
    public class HelloWorldController {
    
       @Get
       @Produces(MediaType.TEXT_PLAIN)
       public String index() {
           return "Hello World!";
       }
    }

The above code snippet is a Micronaut Controller. A controller is a way into the application using HTTP requests.
 
 The @Controller-annotation tells Micronaut that this class is a Controller that it should mount when the application starts. The string parameter defines the base URI of the controller, which is where you’ll access the resources defined in the controller. The method “index()” is annotated with both @Get and @Produces. @Get defines the method as runnable with a GET request on the base URI of the controller. If a string parameter is provided to the @Get-annotation, you can GET the resource on the base URI + the string parameter. The @Produces-annotation defines which Content-Type that particular resource provides. If you now run the application again, you’ll see that you get the expected response when you go to “http://localhost:8080/hello”, “Hello World!”. Micronaut automatically detected our controller and mounted it when the application started!

Micronaut allows you to define resources called “beans”, which are arbitrary classes that can be injected into your code. This controller is one such bean. Injection, or more precisely Dependency Injection, is the process of providing a dependency without manually providing it in your code. Micronaut performs a lot of background magic, which injects the required beans when an object is created. This is what Micronaut does with our controller. Any object can be a bean, and this is often used to create configuration objects that can be injected wherever it is needed. Another common use for beans is so-called services, which perform any arbitrary business logic, and is what we're looking at next.