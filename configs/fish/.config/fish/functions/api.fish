function api --wraps='curl' --description 'alias api=curl $argv | jq -C'
  curl $argv | jq -C
end
