#!/bin/sh

# Automatically regenerate the OpenSSF Best Practices Badge section for
# SECURITY-INSIGHTS.

# Where to store results.
RESULTS=',openssf-bp-badge.yml'

# Print the header
cat <<'DONE'
    openssf-bp-badge:
        $id: '#/properties/openssf-bp-badge'
        additionalProperties: true
        properties:
DONE

# Download criteria list from OpenSSF Best Practices Badge
# This creates a sorted list of unique values.
curl -i 'https://raw.githubusercontent.com/coreinfrastructure/best-practices-badge/refs/heads/main/criteria/criteria.yml' | \
  grep '^      - ' | sed -e 's/^ *- //' -e 's/ *#.*//' -e 's/:$//' | \
  sort | uniq > ,criteria

# Generate specification for each criterion.
while read criterion ; do
  printf '            %s:\n' "$criterion"
  printf '                $id: #/properties/project-lifecycle/properties/%s\n' "$criterion"
  printf '                description: Criterion %s\n' "$criterion"
  printf '                properties:\n'
  printf '                    status:\n'
  printf '                        $id: #/properties/project-lifecycle/properties/%s/properties/status\n' "$criterion"
  printf '                        description: Status of criterion %s\n' "$criterion"
  printf '                        type: string\n'
  printf "                        pattern: '     ^(Met|Unmet|\?|N\/A)$'\n"
  printf '                    justification:\n'
  printf '                        $id: #/properties/project-lifecycle/properties/%s/properties/justification\n' "$criterion"
  printf '                        description: Justification of criterion %s in Markdown format\n' "$criterion"
  printf '                        type: string\n'
done < ,criteria > "$RESULTS"

echo "Results stored in $RESULTS"
