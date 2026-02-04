import Foundation

public enum BuildEnvironment: String {
    case staging = "STAGING"
    case uat = "UAT"
    case prod = "PROD"

    /// Returns the environment derived from compile-time flags.
    public static var current: BuildEnvironment {
        #if STAGING
        return .staging
        #elseif UAT
        return .uat
        #else
        return .prod
        #endif
    }

    /// A displayable name for the environment.
    public static var name: String { current.rawValue }

    /// A longer description that can be shown in UI or logs.
    public static var description: String {
        switch current {
        case .staging:
            return "Running STAGING build"
        case .uat:
            return "Running UAT build"
        case .prod:
            return "Running PROD build"
        }
    }
}
