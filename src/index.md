---
toc: false
---
```jsx 
const weight_key = "weight_localStorage";
const height_key = "height_localStorage";
const age_key = "age_localStorage";
const sex_key = "sex_localStorage";

const default_weight = localStorage.getItem(weight_key) || 60;
const weightInput = Inputs.range([0, 200], {step: 0.1, value: default_weight, label: "Weight in kg:"})
const weight_kg = Generators.input(weightInput);

const default_height = localStorage.getItem(height_key) || 170;
const heightInput = Inputs.range([0, 250], {step: 1, value: default_height, label: "Height in cm:"});
const height_cm = Generators.input(heightInput);

const default_age = localStorage.getItem(age_key) || 25;
const ageInput = Inputs.range([0, 100], {step: 1, value: default_age, label: "Age in years:"});
const age_years = Generators.input(ageInput);

const default_sex = localStorage.getItem(sex_key) || "male";
const sexInput = Inputs.radio(["male", "female"], {label: "Sex:", value: default_sex});
const sex = Generators.input(sexInput);
const sex_modifier = (sex) => sex == "male" ? 5 : -161;

const get_kcal = function(kg, cm, years, sex) {
  localStorage.setItem(weight_key, kg);
  localStorage.setItem(height_key, cm);
  localStorage.setItem(age_key, years);
  localStorage.setItem(sex_key, sex);
  const kcal = 10 * kg + 6.25 * cm - 5 * years + sex_modifier(sex) ;
  return Math.round(kcal);
}
```

<div class="hero">
  <h1>${get_kcal(weight_kg, height_cm, age_years, sex)} kcal</h1>
  <h2>Welcome to your new project! Edit&nbsp;<code style="font-size: 90%;">src/index.md</code> to change this page.</h2>
</div>

<div class="grid grid-cols-1">
  <div class="card">
    ${weightInput}
    ${heightInput}
    ${ageInput}
    ${sexInput}
  </div>
</div>

<div class="grid grid-cols-2" style="grid-auto-rows: 504px;">
  <div class="card">${
    resize((width) => Plot.plot({
      title: "Your awesomeness over time 🚀",
      subtitle: "Up and to the right!",
      width,
      y: {grid: true, label: "Awesomeness"},
      marks: [
        Plot.ruleY([0]),
        Plot.lineY(aapl, {x: "Date", y: "Close", tip: true})
      ]
    }))
  }</div>
  <div class="card">${
    resize((width) => Plot.plot({
      title: "How big are penguins, anyway? 🐧",
      width,
      grid: true,
      x: {label: "Body mass (g)"},
      y: {label: "Flipper length (mm)"},
      color: {legend: true},
      marks: [
        Plot.linearRegressionY(penguins, {x: "body_mass_g", y: "flipper_length_mm", stroke: "species"}),
        Plot.dot(penguins, {x: "body_mass_g", y: "flipper_length_mm", stroke: "species", tip: true})
      ]
    }))
  }</div>
</div>

<style>

.hero {
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: var(--sans-serif);
  margin: 4rem 0 8rem;
  text-wrap: balance;
  text-align: center;
}

.hero h1 {
  margin: 1rem 0;
  padding: 1rem 0;
  max-width: none;
  font-size: 14vw;
  font-weight: 900;
  line-height: 1;
  background: linear-gradient(30deg, var(--theme-foreground-focus), currentColor);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero h2 {
  margin: 0;
  max-width: 34em;
  font-size: 20px;
  font-style: initial;
  font-weight: 500;
  line-height: 1.5;
  color: var(--theme-foreground-muted);
}

@media (min-width: 640px) {
  .hero h1 {
    font-size: 90px;
  }
}

</style>
