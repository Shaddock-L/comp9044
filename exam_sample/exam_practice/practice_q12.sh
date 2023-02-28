#! /bin/dash

CANDIDATE_FILE="$(mktemp)"
CLEAN_CANDIDATE_FILE="$(mktemp)"
cat "$1" | grep '.' | sort > "$CANDIDATE_FILE"
cat "$1" | grep '.' | sed -E 's/\s*//g' | tr '[:upper:]' '[:lower:]' | sort > "$CLEAN_CANDIDATE_FILE"
shift

for file in $@; do
    VOTE_FILE="$(mktemp)"
    cat "$file" | grep '.' | sed -E 's/\s*//g' | tr '[:upper:]' '[:lower:]' | grep -f "$CANDIDATE_FILE" > "$VOTE_FILE"
    SORTED_VOTE_FILE="$(mktemp)"
    sort "$VOTE_FILE" > "$SORTED_VOTE_FILE"

    if $(diff "$CLEAN_CANDIDATE_FILE" "$SORTED_VOTE_FILE" > /dev/null); then
        rm -rf "$SORTED_VOTE_FILE"
    else
        echo "$file is not a valid vote" >&2
        rm -rf "$SORTED_VOTE_FILE" "$VOTE_FILE"
        continue
    fi
done