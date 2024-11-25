using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using TesteTecnico_GestaoProfissionais.Models;
using TesteTecnico_GestaoProfissionais.Migrations;
using TesteTecnico_GestaoProfissionais.Models;

namespace TesteTecnico_GestaoProfissionais.Controllers
{
    public class HomeController : Controller
    {
        private readonly Context _context;

        public HomeController(Context context)
        {
            _context = context;
        }

        public IActionResult Index(string especialidade = "Todas", int page = 1)
        {  
            int pageSize = 5;
            var query = _context.Profissionais.AsQueryable();
            int totalItems = query.Count();

            if (especialidade != "Todas")
            {
                query = query.Where(p => p.Nome_Especialidade == especialidade);
            }

            var profissionais = query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalItems / pageSize);
            ViewBag.SelectedEspecialidade = especialidade;
            ViewBag.Especialidades = _context.Especialidades.OrderBy(e => e.Nome_Especialidade).ToList();

            return View(profissionais);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ProfissionalViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                await PrepararViewModel(viewModel);
                TempData["Mensagem"] = "Houve um erro ao criar o profissional!";
                return RedirectToAction(nameof(Index));
            }

            if (await ProfissionalJaExiste(viewModel))
            {
                TempData["MensagemErro"] = "Já existe um profissional cadastrado com este documento.";
                await PrepararViewModel(viewModel);
                return RedirectToAction(nameof(Index));
            }
           
            var profissional = new Profissional
            {
                Nome_Profissional = viewModel.Nome_Profissional,
                Nome_Especialidade = viewModel.Nome_Especialidade,
                Tipo_Documento = viewModel.Tipo_Documento?.Trim(),
                Numero_Documento = viewModel.Numero_Documento?.Trim()
            };

           
            _context.Add(profissional);
            await _context.SaveChangesAsync();
            TempData["Mensagem"] = "Profissional criado com sucesso!";
            return RedirectToAction(nameof(Index));
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(ProfissionalViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                await PrepararViewModel(viewModel);
                TempData["MensagemErro"] = "Houve um erro ao atualizar o profissional!";
                return View("Index", viewModel);
            }

            if (await ProfissionalJaExiste(viewModel, excluirId: viewModel.Id_Profissional))
            {
                TempData["MensagemErro"] = "Já existe um profissional cadastrado com este documento.";
                await PrepararViewModel(viewModel);
                return RedirectToAction(nameof(Index));
            }

            var profissionalExistente = await _context.Profissionais.FindAsync(viewModel.Id_Profissional);
            if (profissionalExistente == null)
            {
                return NotFound();
            }
       
            profissionalExistente.Nome_Profissional = viewModel.Nome_Profissional;
            profissionalExistente.Nome_Especialidade = viewModel.Nome_Especialidade;
            profissionalExistente.Tipo_Documento = viewModel.Tipo_Documento?.TrimEnd();
            profissionalExistente.Numero_Documento = viewModel.Numero_Documento?.TrimEnd();

            _context.Update(profissionalExistente);
            await _context.SaveChangesAsync();
            TempData["Mensagem"] = "Profissional atualizado com sucesso!";
            return RedirectToAction(nameof(Index));
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Excluir(int id)
        {
            var profissional = _context.Profissionais.FirstOrDefault(p => p.Id_Profissional == id);

            if (profissional != null)
            {              
                _context.Profissionais.Remove(profissional);
                _context.SaveChanges();
                TempData["Mensagem"] = "Profissional excluído com sucesso!";
                return RedirectToAction(nameof(Index));
            }

            TempData["MensagemErro"] = "Houve um erro ao excluir o profissional!";
            return RedirectToAction(nameof(Index));
        }

        private async Task<bool> ProfissionalJaExiste(ProfissionalViewModel viewModel, int? excluirId = null)
        {
            return await _context.Profissionais
                .AnyAsync(p => p.Numero_Documento == viewModel.Numero_Documento &&
                               (excluirId == null || p.Id_Profissional != excluirId));
        }
       
        private async Task PrepararViewModel(ProfissionalViewModel viewModel)
        {
            viewModel.ListaEspecialidade = await _context.Especialidades
                .Select(e => new SelectListItem
                {
                    Text = e.Nome_Especialidade,
                    Value = e.Nome_Especialidade.ToString()
                })
                .ToListAsync();

            viewModel.Profissionais = await _context.Profissionais.ToListAsync();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}