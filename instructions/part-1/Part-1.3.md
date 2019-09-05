# 1.3 Micronaut: Beans

The final kind of bean we'll cover in this workshop are just regular old, plain beans. Services and Controllers are different in that they have a predefined purpose in Micronaut. Other kinds of beans can be anything that isn't covered by those two specialized kinds of beans. We can create a bean by annotation a *method* with the @Bean-annotation. A bean can be of any type, but to avoid conflicts, we'll create a specific class for this bean.

    public class Greeting {
    
        private final String greeting;
    
        public Greeting(String greeting) {
            this.greeting = greeting;
        }
    
        @Override
        public String toString() {
            return this.greeting;
        }
    }

We will also create a Greeting bean.

    import io.micronaut.context.annotation.Bean;
    import io.micronaut.context.annotation.Factory;
    import no.dnb.workshop.domain.Greeting;
    
    @Factory
    public class GreetingBeanFactory {
    
        @Bean
        public Greeting getGreeting() {
            return new Greeting("Greetings");
        }
    }

The @Factory-annotation tells Micronaut that this class will produce beans. Without this annotation, @Bean will have no effect. 

We can inject this bean in the same way we injected the Service in the Controller, or we can use the @Inject-annotation. Using constructor-based injection is generally best practice, because it doesn't require reflection when testing, but we'll use @Inject here for completeness' sake. By adding the following to the service we made previously, the bean will be injected automatically.

    @Inject
    private Greeting greeting;

Don't forget to change the greet()-method's return value to `greeting + " Service!"`. When you run this with `/gradlew run`, you'll see that the response you now get will contain the greeting from the Greeting-type bean we made.