new.function <- function(){
  for (i in 1:6){
    print(i*5)
  }
}

my_defaultFunc <- function(a, b=10){
  print(a+b)
  }

sum_of_2_numbers <- function(a,b){
  print(a+b)
}

myCGPA <- function(result,credit){
  total <- 0.0
  for (i in 1:length(result)){
    if (result[i] >= 80){
      total <- total + 4 * credit[i]
    }
    else if (result[i] >= 75 & result[i] <= 79){
      total <- total + 3.7 * credit[i]
    }
    else if (result[i] >= 70 & result[i] <= 74){
      total <- total + 3.3 * credit[i]
    }
    else if (result[i] >= 65 & result[i] <= 69){
      total <- total + 3.0 * credit[i]
    }
    else if (result[i] >= 60 & result[i] <= 64){
      total <- total + 2.7 * credit[i]
    }
    else if (result[i] >= 55 & result[i] <= 59){
      total <- total + 2.3 * credit[i]
    }
    else if (result[i] >= 50 & result[i] <= 54){
      total <- total + 2.0 * credit[i]
    }
    else if (result[i] >= 45 & result[i] <= 49){
      total <- total + 1.7 * credit[i]
    }
    else if (result[i] >= 40 & result[i] <= 44){
      total <- total + 1.3 * credit[i]
    }
    else if (result[i] >= 35 & result[i] <= 39){
      total <- total + 1.0 * credit[i]
    }
    else{
      total <- total + 0
    }
  }
  print(total/sum(credit))
}

