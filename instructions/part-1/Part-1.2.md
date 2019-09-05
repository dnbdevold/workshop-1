# 1.2 Micronaut: Services

As with the controller we just made, we can create a "service" that will be injected into our code. A service is generally any class that performs some sort of business logic. 

For this workshop, we will create a very simple service to demonstrate how we instruct Micronaut to inject the service where we want it. First we'll create a "Service".

    import javax.inject.Singleton;
    
    @Singleton
    public class HelloWorldService {
    
        public String greet() {
            return "Hello Service!";
        }
    }

This is all you need to create an injectable type in Micronaut. The @Singleton-annotation will let Micronaut detect the class and inject it where it's needed. Actually injecting it is just as easy. Going back to controller we made earlier, all we have to do to inject the HelloWorldService, is include it in a constructor.

    private final HelloWorldService helloWorldService;

    public HelloWorldController(HelloWorldService helloWorldService) {
        this.helloWorldService = helloWorldService;
    }

Don't forget to change the index()-method's return value to `helloWorldService.greet()`. When you run this with `/gradlew run`, you'll see that the response you now get will be from the greet()-method in HelloWorldService.

A Micronaut bean can be injected anywhere so long as the class it's injected into is a bean itself, or annotated with @Configuration.