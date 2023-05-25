PROJECT="prj-n-15032023-nprd-uat-svc"

# Get PAIRS (NAME,ZONE) for all disk in ${PROJECT}
# Using CSV  (e.g. my-disk,my-zone) enables IFS parsing (below)
PAIRS=$(\
  gcloud compute disks list \
  --project=${PROJECT} \
  --format="csv[no-heading](name,zone.scope())")

# Iterate over the PAIRS
for PAIR in ${PAIRS}
do
  # Extract values of NAME,ZONE from PAIR
  IFS=, read NAME ZONE <<< ${PAIR}
  # Describe
  printf "Attempting to delete disk: %s [%s]\n" ${NAME} ${ZONE}
  # Deleting a disks should only succeed if not attached
  gcloud compute disks delete ${NAME} \
  --zone=${ZONE} \
  --project=${PROJECT} \
  --quiet
done