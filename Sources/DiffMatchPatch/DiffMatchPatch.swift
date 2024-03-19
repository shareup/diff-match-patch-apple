import Foundation
import diff_match_patch

public func threeWayMerge(
    old: String,
    new: String,
    base: String
) throws -> String {
    let dmp = DiffMatchPatch()
    
    guard let patch = dmp.patch_make(
        fromOldString: old,
        andNewString: new
    ) as? [Any] else {
        throw DiffMatchPatchError.couldNotCreatePatch
    }

    guard let result = dmp.patch_apply(
        patch,
        to: base
    ).first as? String else {
        throw DiffMatchPatchError.couldNotApplyPatch
    }
    
    return result
}

public enum DiffMatchPatchError: Error {
    case couldNotCreatePatch
    case couldNotApplyPatch
}
