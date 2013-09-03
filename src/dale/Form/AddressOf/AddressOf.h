#ifndef DALE_FORM_ADDRESSOF
#define DALE_FORM_ADDRESSOF

namespace dale
{
namespace Form
{
namespace AddressOf
{
bool execute(Generator *gen,
             Element::Function *fn,
             llvm::BasicBlock *block,
             Node *node,
             bool get_address,
             bool prefixed_with_core,
             ParseResult *pr);
}
}
}

#endif