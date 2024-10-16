package examples.tests;

import com.intuit.karate.junit5.Karate;

public class RunnerSpoonacular {
    @Karate.Test
    public Karate runUserConnect() {
        return Karate.run("connectUser").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runMealPlan(){
        return Karate.run("mealPlanRequest").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runRecipes(){
        return Karate.run("recipes").relativeTo(getClass());
    }
}
