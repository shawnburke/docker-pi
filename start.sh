 
# create a file called "active" with a list of folders to execute docer compose in
cat active | while read p
do 
  echo "Starting $p"
  (cd $p && docker-compose up -d)
done

