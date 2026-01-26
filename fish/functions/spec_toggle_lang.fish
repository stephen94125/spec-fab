function spec_toggle_lang --description "Toggle Fabric LANGUAGE_OUTPUT between en-US and Native Locale"
    # --- Configuration ---
    set -l env_file "$HOME/.config/fabric/.env"
    set -l default_lang "en-US"
    
    # Check if the native locale variable is set; if not, fallback to en-US
    if not set -q FABRIC_NATIVE_LOCALE
        # You can set this in your config.fish: set -U FABRIC_NATIVE_LOCALE "en-US"
        echo "⚠️  Warning: FABRIC_NATIVE_LOCALE not set. Defaulting to en-US."
        set -g FABRIC_NATIVE_LOCALE "en-US"
    end

    # --- Validation ---
    if not test -f "$env_file"
        echo "❌ Error: Configuration file missing at $env_file"
        return 1
    end

    # --- Execution ---
    if grep -q "LANGUAGE_OUTPUT=$default_lang" "$env_file"
        # [Case 1] Switch to Native Locale
        
        sed -i.bak "s/^LANGUAGE_OUTPUT=$default_lang/LANGUAGE_OUTPUT=$FABRIC_NATIVE_LOCALE/" "$env_file"
        
        set -Ue LANGUAGE_OUTPUT
        set -U LANGUAGE_OUTPUT "$FABRIC_NATIVE_LOCALE"
        
        echo "🌐 Fabric output switched to Native: $FABRIC_NATIVE_LOCALE"
        
    else
        # [Case 2] Switch back to Default (en-US)
        
        sed -i.bak "s/^LANGUAGE_OUTPUT=.*/LANGUAGE_OUTPUT=$default_lang/" "$env_file"
        
        set -Ue LANGUAGE_OUTPUT
        set -U LANGUAGE_OUTPUT "$default_lang"
        
        echo "🇺🇸 Fabric output reset to Default: $default_lang"
    end
end
