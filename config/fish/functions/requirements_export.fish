function requirements_export --wraps='pip freeze > requirements.txt' --description 'alias requirements_export=pip freeze > requirements.txt'
  pip freeze > requirements.txt $argv; 
end
