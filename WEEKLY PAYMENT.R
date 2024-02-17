# Step 1: Create a list of workers dynamically
workers <- list()

for (i in 1:400) {
  worker <- list(
    id = i,
    name = paste("Worker", i),
    gender = ifelse(i %% 2 == 0, "female", "male"),
    salary = 5000 + i * 25
  )
  workers[[i]] <- worker
}

# Step 2: Generate payment slips for each worker and apply conditions
for (worker in workers) {
  tryCatch({
    salary <- worker$salary
    if (salary > 10000 & salary < 20000) {
      worker$level <- "A1"
    } else if (salary > 7500 & salary < 30000 & worker$gender == "female") {
      worker$level <- "A5-F"
    } else {
      worker$level <- "Regular"
    }
    cat("Payment Slip for", worker$name, "- Level:", worker$level, ", Salary: $", salary, "\n")
  }, error = function(e) {
    cat("Error occurred for worker", worker$id, ": ", conditionMessage(e), "\n")
  })