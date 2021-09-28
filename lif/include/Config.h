//===-- Config.h ------------------------------------------------*- C++ -*-===//
// Copyright (C) 2020  Luigi D. C. Soares
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declaration of the config types required by the
/// isochronous pass.
//===----------------------------------------------------------------------===//
#ifndef LIF_CONFIG_H
#define LIF_CONFIG_H

#include <llvm/Support/YAMLTraits.h>

#include <cstdint>
#include <map>
#include <string>

namespace lif::config {
/// The isochronous pass expects a configuration file declaring the functions
/// that must be transformed. For each function, we must be given the
/// arguments that are observable. Thus, Func is a map between observable
/// arguments and their positions in the function interface.
using Func = std::map<std::string, std::uint16_t>;

/// The configuration of a module is a map between a function name and a
/// function configuration.
using Module = std::map<std::string, Func>;
} // namespace lif::config

LLVM_YAML_IS_STRING_MAP(std::uint16_t);
LLVM_YAML_IS_STRING_MAP(lif::config::Func);

#endif
