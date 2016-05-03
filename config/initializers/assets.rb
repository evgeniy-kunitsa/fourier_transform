Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( fourier_transform.js
                                                  single_function_form.js
                                                  double_function_form.js
                                                  interactive_table.js )
