import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSetting {
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVld2xmdmZwb3RiamtsbHF2a2thIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTk3OTY3MjMsImV4cCI6MTk3NTM3MjcyM30.sLO8m0_QuY1rvD9gEXFwdMHM1vV-0utUI4m9IdBkW4c";

  static const String APIURL = "https://eewlfvfpotbjkllqvkka.supabase.co";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
