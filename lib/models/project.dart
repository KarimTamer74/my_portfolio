class Project {
  final String title;
  final String description; // Short description for the card
  final String longDescription; // Detailed description for the detail page
  final List<String>? imageUrls;
  final List<String> tags;
  final String githubUrl;
  final String? driveUrl; // Link for a live demo or other resources
  final String? appUrl; // <-- ADD THIS NEW FIELD

  Project({
    required this.title,
    required this.description,
   required this.longDescription,
    required this.imageUrls,
    required this.tags,
    required this.githubUrl,
    this.driveUrl,
    this.appUrl, // <-- ADD THIS NEW FIELD
  });
}
