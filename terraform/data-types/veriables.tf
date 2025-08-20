variable name {
  type        = string
  default     = "Abhinesh"
  description = "test string variable"
}

variable age {
  type        = number
  default     = 25
  description = "test number variable"
}

variable is_active {
  type        = bool
  default     = true
  description = "test boolean variable"
}

# If we do not give value for the variable, it will ask in the run time
variable string_value {
  description = "What is your name?"
}


variable string_with_validation {
  type        = string
  description = "String with validation (>5 characters required)"
    validation {
    condition     = length(var.string_with_validation) > 5
    error_message = "String must be longer than 5 characters."
    }
}


variable object_variable {
  type = object({
    name = string
    age  = number
  })
  default = {
    name = "John Doe"
    age  = 30
  }
  description = "An example of an object variable"
}