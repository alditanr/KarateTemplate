package examples.capstone;

import com.intuit.karate.junit5.Karate;

public class RunnerCapstone {
    @Karate.Test
    public Karate runTasty() {
        return Karate.run("tasty").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runWeather() {
        return Karate.run("weather").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runSpoonacular() {
        return Karate.run("spoonacular").relativeTo(getClass());
    }
}
