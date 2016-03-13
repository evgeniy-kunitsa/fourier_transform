Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( fourier_transform.js )
Rails.application.config.assets.precompile += %w( fourier_function_form.js )
Rails.application.config.assets.precompile += %w( interactive_table.js )
