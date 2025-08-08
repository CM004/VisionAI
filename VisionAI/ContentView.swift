import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            EyeCheckView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Eye Check")
                }
            
            EducationView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Learn")
                }
            
            ResultsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Results")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.blue)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 10) {
                        Image(systemName: "eye.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        Text("VisionAI")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Your AI-Powered Eye Health Companion")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)
                    
                    // Quick Actions
                    QuickActionsSection()
                    
                    // Recent Activity
                    RecentActivitySection()
                    
                    // Health Tips
                    HealthTipsSection()
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct QuickActionsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Quick Actions")
                .font(.title2)
                .fontWeight(.bold)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 15) {
                QuickActionCard(
                    icon: "camera.fill",
                    title: "New Eye Check",
                    subtitle: "Take a photo",
                    color: .blue
                )
                
                QuickActionCard(
                    icon: "chart.bar.fill",
                    title: "View Results",
                    subtitle: "See history",
                    color: .green
                )
                
                QuickActionCard(
                    icon: "book.fill",
                    title: "Learn More",
                    subtitle: "Eye health tips",
                    color: .orange
                )
                
                QuickActionCard(
                    icon: "calendar.badge.clock",
                    title: "Schedule Check",
                    subtitle: "Set reminder",
                    color: .purple
                )
            }
        }
    }
}

struct QuickActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(color.opacity(0.1))
                )
            
            VStack(spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct RecentActivitySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Recent Activity")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                ActivityRow(
                    icon: "checkmark.circle.fill",
                    title: "Eye Check Completed",
                    subtitle: "Today, 2:30 PM",
                    color: .green
                )
                
                ActivityRow(
                    icon: "exclamationmark.triangle.fill",
                    title: "Follow-up Recommended",
                    subtitle: "Yesterday, 10:15 AM",
                    color: .orange
                )
                
                ActivityRow(
                    icon: "calendar.badge.clock",
                    title: "Next Check Reminder",
                    subtitle: "In 3 days",
                    color: .blue
                )
            }
        }
    }
}

struct ActivityRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
    }
}

struct HealthTipsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Health Tips")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                TipCard(
                    title: "Regular Eye Checks",
                    description: "Schedule eye examinations every 6-12 months for early detection",
                    icon: "calendar.badge.clock",
                    color: .blue
                )
                
                TipCard(
                    title: "Protect Your Eyes",
                    description: "Wear sunglasses outdoors and take breaks from screens",
                    icon: "eye.fill",
                    color: .green
                )
            }
        }
    }
}

struct TipCard: View {
    let title: String
    let description: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(color.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
    }
}

struct EyeCheckView: View {
    @State private var showingCamera = false
    @State private var isProcessing = false
    @State private var showingInstructions = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Header
                    VStack(spacing: 15) {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        Text("Instant Eye Check")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Take a clear, well-lit photo of your eye for AI analysis")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Camera Interface
                    CameraInterfaceSection(
                        showingCamera: $showingCamera,
                        isProcessing: $isProcessing
                    )
                    
                    // Instructions
                    InstructionsSection(showingInstructions: $showingInstructions)
                    
                    // Features
                    FeaturesSection()
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("Eye Check")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CameraInterfaceSection: View {
    @Binding var showingCamera: Bool
    @Binding var isProcessing: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // Camera Preview Placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 300)
                
                VStack(spacing: 15) {
                    Image(systemName: "eye.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    Text("Position your eye in the frame")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Ensure good lighting")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            
            // Camera Controls
            HStack(spacing: 30) {
                Button("Instructions") {
                    // Show instructions
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                )
                
                Button(action: {
                    showingCamera = true
                    isProcessing = true
                }) {
                    Image(systemName: "camera.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                }
                
                Button("Gallery") {
                    // Access photo library
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                )
            }
            
            // Processing State
            if isProcessing {
                VStack(spacing: 15) {
                    ProgressView()
                        .scaleEffect(1.5)
                    
                    Text("Processing on your device...")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("This ensures your privacy")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
            }
        }
    }
}

struct InstructionsSection: View {
    @Binding var showingInstructions: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("How to take the perfect photo:")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                InstructionRow(number: "1", text: "Find a well-lit area")
                InstructionRow(number: "2", text: "Hold phone steady, 6-8 inches from eye")
                InstructionRow(number: "3", text: "Look straight ahead, keep eye open")
                InstructionRow(number: "4", text: "Take photo when frame is green")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct InstructionRow: View {
    let number: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Text(number)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(width: 25, height: 25)
                .background(
                    Circle()
                        .fill(Color.blue.opacity(0.1))
                )
            
            Text(text)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct FeaturesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("What you'll get:")
                .font(.headline)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 15) {
                FeatureItem(icon: "target", title: "Problem Detection", description: "AI identifies potential issues")
                FeatureItem(icon: "chart.bar.fill", title: "Confidence Score", description: "See how certain the AI is")
                FeatureItem(icon: "exclamationmark.triangle.fill", title: "Health Guidance", description: "Get actionable advice")
                FeatureItem(icon: "lock.fill", title: "Privacy First", description: "All processing on device")
            }
        }
    }
}

struct FeatureItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(Color.blue.opacity(0.1))
                )
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(description)
                .font(.caption2)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
    }
}

struct EducationView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 15) {
                        Image(systemName: "book.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.blue)
                        
                        Text("Learn About Eye Health")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Stay informed about early detection and prevention")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Categories
                    CategoriesSection()
                    
                    // Featured Articles
                    FeaturedArticlesSection()
                    
                    // Interactive Quiz
                    QuizSection()
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("Education")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CategoriesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Categories")
                .font(.title2)
                .fontWeight(.bold)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 15) {
                CategoryCard(
                    title: "Early Warning Signs",
                    icon: "exclamationmark.triangle.fill",
                    color: .orange,
                    count: "5 articles"
                )
                
                CategoryCard(
                    title: "Prevention Tips",
                    icon: "shield.fill",
                    color: .green,
                    count: "8 articles"
                )
                
                CategoryCard(
                    title: "Regular Check-ups",
                    icon: "calendar.badge.clock",
                    color: .purple,
                    count: "3 articles"
                )
                
                CategoryCard(
                    title: "AI in Healthcare",
                    icon: "brain.head.profile",
                    color: .blue,
                    count: "6 articles"
                )
            }
        }
    }
}

struct CategoryCard: View {
    let title: String
    let icon: String
    let color: Color
    let count: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(color.opacity(0.1))
                )
            
            VStack(spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Text(count)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct FeaturedArticlesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Featured Articles")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                ArticleCard(
                    title: "Understanding Eye Cancer Symptoms",
                    subtitle: "Learn the early warning signs",
                    readTime: "5 min read",
                    isNew: true
                )
                
                ArticleCard(
                    title: "How AI is Revolutionizing Eye Care",
                    subtitle: "The future of early detection",
                    readTime: "3 min read",
                    isNew: false
                )
                
                ArticleCard(
                    title: "Prevention Strategies for Eye Health",
                    subtitle: "Simple steps to protect your vision",
                    readTime: "4 min read",
                    isNew: false
                )
            }
        }
    }
}

struct ArticleCard: View {
    let title: String
    let subtitle: String
    let readTime: String
    let isNew: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    if isNew {
                        Text("NEW")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.red)
                            )
                    }
                }
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(readTime)
                    .font(.caption2)
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
    }
}

struct QuizSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Test Your Knowledge")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                QuizCard(
                    title: "Eye Health Quiz",
                    subtitle: "10 questions about eye care",
                    progress: "0/10 completed",
                    color: .blue
                )
                
                QuizCard(
                    title: "AI in Healthcare",
                    subtitle: "Learn about AI applications",
                    progress: "3/8 completed",
                    color: .green
                )
            }
        }
    }
}

struct QuizCard: View {
    let title: String
    let subtitle: String
    let progress: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "questionmark.circle.fill")
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(color.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(progress)
                    .font(.caption2)
                    .foregroundColor(color)
            }
            
            Spacer()
            
            Button("Start") {
                // Start quiz
            }
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
    }
}

struct ResultsView: View {
    @State private var selectedFilter = "All"
    let filters = ["All", "This Week", "This Month", "This Year"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Filter Picker
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(filters, id: \.self) { filter in
                        Text(filter).tag(filter)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Summary Card
                        SummaryCard()
                        
                        // Results List
                        ResultsListSection()
                    }
                    .padding()
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("Results")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SummaryCard: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Total Checks")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("12")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Last Check")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Today")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
            
            Divider()
            
            HStack(spacing: 30) {
                VStack(spacing: 5) {
                    Text("Normal")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("10")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                
                VStack(spacing: 5) {
                    Text("Follow-up")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("2")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
                
                VStack(spacing: 5) {
                    Text("Urgent")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("0")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct ResultsListSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Recent Results")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                ResultCard(
                    date: "Today, 2:30 PM",
                    status: "Normal",
                    confidence: "95%",
                    color: .green
                )
                
                ResultCard(
                    date: "Yesterday, 10:15 AM",
                    status: "Follow-up Recommended",
                    confidence: "87%",
                    color: .orange
                )
                
                ResultCard(
                    date: "3 days ago",
                    status: "Normal",
                    confidence: "92%",
                    color: .green
                )
            }
        }
    }
}

struct ResultCard: View {
    let date: String
    let status: String
    let confidence: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(spacing: 8) {
                Image(systemName: color == .green ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                    .font(.title2)
                    .foregroundColor(color)
                
                Text(confidence)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(status)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button("View") {
                // View detailed results
            }
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
    }
}

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var privacyMode = true
    @State private var autoSave = true
    @State private var darkMode = false
    @State private var biometricAuth = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Section
                    ProfileSection()
                    
                    // App Settings
                    AppSettingsSection(
                        notificationsEnabled: $notificationsEnabled,
                        privacyMode: $privacyMode,
                        autoSave: $autoSave,
                        darkMode: $darkMode,
                        biometricAuth: $biometricAuth
                    )
                    
                    // Data & Privacy
                    DataPrivacySection()
                    
                    // Support
                    SupportSection()
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ProfileSection: View {
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            VStack(spacing: 5) {
                Text("VisionAI User")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Member since 2024")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Button("Edit Profile") {
                // Edit profile
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct AppSettingsSection: View {
    @Binding var notificationsEnabled: Bool
    @Binding var privacyMode: Bool
    @Binding var autoSave: Bool
    @Binding var darkMode: Bool
    @Binding var biometricAuth: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("App Settings")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 0) {
                SettingsRow(
                    icon: "bell.fill",
                    title: "Notifications",
                    subtitle: "Get alerts for check reminders",
                    isToggle: true,
                    toggleValue: $notificationsEnabled
                )
                
                SettingsRow(
                    icon: "lock.fill",
                    title: "Privacy Mode",
                    subtitle: "Process everything on device",
                    isToggle: true,
                    toggleValue: $privacyMode
                )
                
                SettingsRow(
                    icon: "square.and.arrow.down",
                    title: "Auto Save Results",
                    subtitle: "Save check results automatically",
                    isToggle: true,
                    toggleValue: $autoSave
                )
                
                SettingsRow(
                    icon: "moon.fill",
                    title: "Dark Mode",
                    subtitle: "Use dark appearance",
                    isToggle: true,
                    toggleValue: $darkMode
                )
                
                SettingsRow(
                    icon: "faceid",
                    title: "Biometric Authentication",
                    subtitle: "Use Face ID or Touch ID",
                    isToggle: true,
                    toggleValue: $biometricAuth
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
        }
    }
}

struct DataPrivacySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Data & Privacy")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 0) {
                SettingsRow(
                    icon: "doc.text",
                    title: "Export Data",
                    subtitle: "Download your health data",
                    isToggle: false,
                    toggleValue: .constant(false)
                )
                
                SettingsRow(
                    icon: "trash",
                    title: "Delete All Data",
                    subtitle: "Permanently remove your data",
                    isToggle: false,
                    toggleValue: .constant(false)
                )
                
                SettingsRow(
                    icon: "hand.raised.fill",
                    title: "Privacy Policy",
                    subtitle: "Read our privacy policy",
                    isToggle: false,
                    toggleValue: .constant(false)
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
        }
    }
}

struct SupportSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Support")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 0) {
                SettingsRow(
                    icon: "questionmark.circle",
                    title: "Help Center",
                    subtitle: "Find answers to common questions",
                    isToggle: false,
                    toggleValue: .constant(false)
                )
                
                SettingsRow(
                    icon: "envelope",
                    title: "Contact Support",
                    subtitle: "Get help from our team",
                    isToggle: false,
                    toggleValue: .constant(false)
                )
                
                SettingsRow(
                    icon: "star.fill",
                    title: "Rate App",
                    subtitle: "Share your feedback",
                    isToggle: false,
                    toggleValue: .constant(false)
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let isToggle: Bool
    @Binding var toggleValue: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if isToggle {
                Toggle("", isOn: $toggleValue)
                    .labelsHidden()
            } else {
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}

#Preview {
    ContentView()
}
