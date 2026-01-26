function spec_translate --description "Translate document using current Fabric language setting"
    # Usage: spec_translate filename.md
    
    # 1. Check arguments
    if test (count $argv) -eq 0
        echo "❌ Error: Missing filename."
        echo "Usage: spec_translate <filename>"
        return 1
    end

    set -l target_file $argv[1]

    # 2. Check if file exists
    if not test -f "$target_file"
        echo "❌ Error: File '$target_file' not found."
        return 1
    end

    echo "🌐 Translating '$target_file'..." >&2
    # Check if LANGUAGE_OUTPUT is set, otherwise display default
    if set -q LANGUAGE_OUTPUT
        echo "   (Current Fabric Locale: $LANGUAGE_OUTPUT)" >&2
    else
        echo "   (Current Fabric Locale: Default/en-US)" >&2
    end

    # 3. Execute translation
    # Note: Uses translate_doc (ensure the pattern name is consistent)
    cat "$target_file" | fabric -p translate_doc | tee "$target_file.tmp"

    # 4. Write back to file (Safely Swap)
    # Only overwrite if the translation output is not empty
    if test -s "$target_file.tmp"
        # [NEW] Backup original file
        echo "📦 Backing up original to '$target_file.bak'..." >&2
        mv "$target_file" "$target_file.bak"

        # Move new file into place
        mv "$target_file.tmp" "$target_file"
        echo "✅ Translation complete!" >&2
    else
        rm "$target_file.tmp"
        echo "❌ Error: Translation failed (empty output). Original file restored." >&2
        return 1
    end
end
