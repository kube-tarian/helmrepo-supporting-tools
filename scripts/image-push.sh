# Set your GitHub repository details
GITHUB_USERNAME="kube-tarian"
GITHUB_REPOSITORY="helmrepo-supporting-tools"
GITHUB_TOKEN="${{ secrets.GITHUB_TOKEN }}"

# Iterate over the list of images
while IFS= read -r image; do
  # Check if the image is from docker.io
  if [[ $image == "docker.io"* || $image != *".io"* && $image != *".com"* ]]; then
    # Pull the image
    docker pull "$image"

    # Tag the image with the GitHub repository URL
    github_image="ghcr.io/$GITHUB_USERNAME/$GITHUB_REPOSITORY/$(echo "$image" | awk -F '/' '{print $NF}')"
    docker tag "$image" "$github_image"

    # Log in to GitHub Container Registry
    docker login ghcr.io -u "$GITHUB_USERNAME" -p "$GITHUB_TOKEN"

    # Push the image to GitHub Container Registry
    docker push "$github_image"
  fi
done < images/capten-images.txt
